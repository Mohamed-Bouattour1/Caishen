import { Injectable } from '@nestjs/common';
import { CreateSimulationDto } from './dto/create-simulation.dto';
import { InjectModel } from '@nestjs/mongoose';
import { simulation } from './schemas/simulation.schema';
import { Model, ObjectId } from 'mongoose';
import { User } from '../auth/schemas/user.schema';
import { log, round, string } from 'mathjs';
import { AuthService } from 'src/auth/auth.service';
import { PDFDocument, StandardFonts, rgb } from 'pdf-lib';



@Injectable()
export class SimulationService {

  constructor(@InjectModel(simulation.name) private simulationModel: Model<simulation>, private readonly authService: AuthService) { }

  async addsim(createSimulationDto: CreateSimulationDto, user: User): Promise<simulation> {

    const data = Object.assign({ user: user._id }, createSimulationDto);
    const createdsim = new this.simulationModel(data);
    createdsim.taux_periodique = createdsim.taux_app / createdsim.nbr_periodes
    
    createdsim.createdAt = (" "+new Date().toISOString()).substring(0,19).replace("T"," ");
    console.log(createdsim.createdAt)


    if (createdsim.mnt_crd && createdsim.duree_rnb) {
      createdsim.type = 'Montant Remboursement'
      createdsim.nbr_echeances = createdsim.duree_rnb / createdsim.periodicite
      createdsim.nbr_echeances = createdsim.duree_rnb / createdsim.periodicite
      createdsim.mnt_rnb = round((createdsim.mnt_crd * createdsim.taux_periodique / (1 - Math.pow(1 + createdsim.taux_periodique, -createdsim.nbr_echeances))), 3)



      console.log(createdsim.mnt_rnb, "mntrnb")
    } else if (createdsim.duree_rnb && createdsim.mnt_rnb) {
      createdsim.type = 'Montant Crédit'

      createdsim.nbr_echeances = createdsim.duree_rnb / createdsim.periodicite
      createdsim.mnt_crd = round((createdsim.mnt_rnb / createdsim.taux_periodique) * (1 - Math.pow(1 + createdsim.taux_periodique, -createdsim.nbr_echeances)), 3)



      console.log(createdsim.mnt_crd, "mntcrd")


    } else if (createdsim.mnt_crd && createdsim.mnt_rnb) {


      createdsim.type = 'Durée Remboursement'
      createdsim.nbr_echeances = createdsim.mnt_rnb / createdsim.periodicite
      const x = log(createdsim.mnt_rnb / (createdsim.mnt_rnb - (createdsim.mnt_crd * createdsim.taux_periodique)))
      console.log(x)
      const y = log(1 + createdsim.taux_periodique)
      console.log(y)
      createdsim.duree_rnb = round(createdsim.periodicite * (x / y + 0.5), 0)
      console.log(createdsim.duree_rnb, "duree")


    }
    createdsim.montant_rnb_total = createdsim.mnt_rnb * createdsim.duree_rnb

  
    return createdsim.save();
  }

  async getAllsim(user: User): Promise<simulation[]> {
    return this.simulationModel.find({ user: user._id }).exec();
  }

  async getOnesim(id: string, user: User): Promise<simulation> {
    return this.simulationModel.findOne({ _id: id, user: user._id }).exec();
  }
 

  /*  async updatesim(id: string, simulation: simulation ): Promise<simulation> {
     return this.simulationModel.findByIdAndUpdate(id, simulation, {
       new: true,
       runValidators: true,
     });
   } */

  removesim(id: string, user: User) {
    return this.simulationModel.findOneAndDelete({ _id: id, user: user._id });
  }



  async addsiminv(createSimulationDto: CreateSimulationDto, imei: number): Promise<simulation> {

    const inv = this.authService.createInvt(imei);
    const data = Object.assign({ invite: (await inv)._id }, createSimulationDto);
    const createdsim = new this.simulationModel(data);
    createdsim.taux_periodique = createdsim.taux_app / createdsim.nbr_periodes
    createdsim.createdAt = (" "+new Date().toISOString()).substring(0,10);
    console.log(createdsim.createdAt)


    if (createdsim.mnt_crd && createdsim.duree_rnb) {
      createdsim.type = 'Montant Remboursement'
      createdsim.nbr_echeances = createdsim.duree_rnb / createdsim.periodicite
      createdsim.nbr_echeances = createdsim.duree_rnb / createdsim.periodicite
      createdsim.mnt_rnb = round((createdsim.mnt_crd * createdsim.taux_periodique / (1 - Math.pow(1 + createdsim.taux_periodique, -createdsim.nbr_echeances))), 3)



      /* createdsim.montant_rnb_total = createdsim.mnt_crd+((createdsim.mnt_crd*createdsim.taux_app)/100);

      createdsim.mnt_rnb = createdsim.montant_rnb_total/createdsim.duree_rnb; */

      console.log(createdsim.mnt_rnb, "mntrnb")
    } else if (createdsim.duree_rnb && createdsim.mnt_rnb) {
      createdsim.type = 'Montant Crédit'

      createdsim.nbr_echeances = createdsim.duree_rnb / createdsim.periodicite
      createdsim.mnt_crd = round((createdsim.mnt_rnb / createdsim.taux_periodique) * (1 - Math.pow(1 + createdsim.taux_periodique, -createdsim.nbr_echeances)), 3)


      /*createdsim.montant_rnb_total = createdsim.mnt_rnb*createdsim.duree_rnb;

      createdsim.mnt_crd = createdsim.montant_rnb_total-((createdsim.montant_rnb_total*createdsim.taux_app)/100);*/

      console.log(createdsim.mnt_crd, "mntcrd")


    } else if (createdsim.mnt_crd && createdsim.mnt_rnb) {

      createdsim.type = 'Durée Remboursement'

      createdsim.nbr_echeances = createdsim.mnt_rnb / createdsim.periodicite
      const x = log(createdsim.mnt_rnb / (createdsim.mnt_rnb - (createdsim.mnt_crd * createdsim.taux_periodique)))
      console.log(x)
      const y = log(1 + createdsim.taux_periodique)
      console.log(y)
      createdsim.duree_rnb = round(createdsim.periodicite * (x / y + 0.5), 0)
      console.log(createdsim.duree_rnb, "duree")



      /* createdsim.montant_rnb_total = createdsim.mnt_crd+((createdsim.mnt_crd*createdsim.taux_app)/100);
      createdsim.duree_rnb = createdsim.montant_rnb_total/createdsim.mnt_rnb; */
    }
    createdsim.montant_rnb_total = createdsim.mnt_rnb * createdsim.duree_rnb

    return createdsim.save();
  }
  async generateTablePdf(id: ObjectId, user:User): Promise<Buffer>{
    //const sim = await this.simulationModel.findOne({ _id: id})
      return await this.generateTablePdfinv(id,user.nom+""+user.prenom);
  }


  async generateTablePdfinv(id: ObjectId, nom: string): Promise<Buffer> {
    console.log(id)
    const sim = await this.simulationModel.findOne({ _id: id})
    const pdfDoc = await PDFDocument.create();
  const page = pdfDoc.addPage();
  const table = [
    ["simulation du "+sim.createdAt],
    ['en faveur de '+nom],
    ["Type :",sim.type],
    ['Montant crédit :',sim.mnt_crd+"DT"],
    [ 'Montant échéance :',sim.mnt_rnb+"DT"],
    ['Durée :', sim.duree_rnb+" Mois"],
    [  'Taux appliqué :', sim.taux_app*100+' %' ],
    [ 'Total remboursement :', sim.montant_rnb_total+"DT"],
  ];



  const tableWidth = 500;
  const tableHeight = 30;
  const cellMargin = 5;
  const yStart = page.getHeight() - 50;
  const xStart = 50;

  const font = await pdfDoc.embedFont(StandardFonts.Helvetica);
  const fontSize = 12;

  page.setFont(font);
  page.setFontSize(fontSize);

  // Dessiner un rectangle autour du tableau
  const rectY = yStart - (table.length * tableHeight) - cellMargin;
  const rectHeight = (table.length * tableHeight) + (cellMargin * (table.length - 1));
  page.drawRectangle({
    x: xStart,
    y: rectY,
    width: tableWidth,
    height: rectHeight,
    borderColor: rgb(0, 0, 0),
    borderWidth: 1,
  });

 
  for (let row = 0; row < table.length; row++) {
    const rowText = table[row].join('  ');
const y = yStart - row * tableHeight - cellMargin;
const textWidth = font.widthOfTextAtSize(rowText, fontSize);
const x = (page.getWidth() - textWidth) / 2;
page.drawText(rowText, {
  x,
  y,
  size: fontSize,
  color: rgb(0, 0, 0),
});
  }
 
  const pdfBytes = await pdfDoc.save(); 
  
    return Buffer.from(pdfBytes.buffer);
  }




  /* private simulations = [
  {id :0 ,montant : 500 , duree : 8 , montant_total :null }
]

  create(createSimulationDto: CreateSimulationDto) {
const newsimulation = {id :1,...createSimulationDto}
newsimulation.montant_total = newsimulation.montant*newsimulation.duree;
this.simulations.push(newsimulation);
    return newsimulation.montant_total;
  }

  findAll() {
    return this.simulations;
  }

  findOne(id: number) {
    const simulation = this.simulations.find((simulation)=>simulation.id===id)
    return simulation ;
  }

  update(id: number, updateSimulationDto: UpdateSimulationDto) {
    this.simulations = this.simulations.map((simulation)=>{
      if (simulation.id===id)
      {
        simulation.montant_total = simulation.montant*simulation.duree;
        return {... simulation , ...updateSimulationDto};
      }
      return simulation;
    });
    return this.findOne(id);
    
  }

  remove(id: number) {
    const toBeRemoved = this.findOne(id);
this.simulations = this.simulations.filter((simulation) => simulation.id !== id);
    return toBeRemoved ;
  } */
}
