// using {
//   managed,
//  // custom.managed,
//   sap.common.CodeList
// } from './common';
using { sap, managed } from '@sap/cds/common';
using {
  sap.fe.cap.petcare.BreedType,
  sap.fe.cap.petcare.PetType,
  sap.fe.cap.petcare.Pet_FoodItemTypes,
  sap.fe.cap.petcare.Pet_GroomingServiceTypes,
  sap.fe.cap.petcare.Pet_MedicalServiceTypes,
  sap.fe.cap.petcare.Pet_MedicalTypes,
} from './master-data';

namespace sap.fe.cap.petcare;

entity PetCare : managed {
  key PetID           : Integer @Core.Computed;
      Name            : String(40);
      Gender          : String(1);
      DOB             : Date;
      Colour          : String(20);
      PetCode         : String(2);
      to_PetType      : Association to PetType
                          on to_PetType.PetCode = PetCode;
      to_BreedType    : Association to BreedType
                          on to_BreedType.PetCode = PetCode;
      PetPicURL       : String @UI: {IsImageURL: true};
      to_PetMedicaL   : Composition of many Pet_Medical
                          on to_PetMedicaL.to_PetCare = $self;
      to_PetNutrition : Composition of many Pet_Nutrition
                          on to_PetNutrition.to_PetCare = $self;
      to_PetGrooming  : Composition of many Pet_Grooming
                          on to_PetGrooming.to_PetCare = $self;
};


entity Pet_Medical : managed {
  key MedicalID             : Integer @Core.Computed;
      Service               : Association to Pet_MedicalServiceTypes;
      Title                 : String(20);
      Notes                 : String(50);
      VaccinationDate       : Date;
      VaccinationExpiryDate : Date;
      MedicalType           : Association to Pet_MedicalTypes;
      to_PetCare            : Association to PetCare;
};

entity Pet_Nutrition : managed {
  key FoodID     : Integer @Core.Computed;
      FoodItemCode : String(2);
      to_FoodItem   : Association to Pet_FoodItemTypes on to_FoodItem.FoodItemCode = FoodItemCode;
      Notes      : String(50);
      Date       : Date;
      Time       : Time;
      to_PetCare : Association to PetCare;
};

entity Pet_Grooming : managed {
  key GroomingID      : Integer @Core.Computed;
      GroomingCode    : String(2);
      to_GroomingService : Association to Pet_GroomingServiceTypes on to_GroomingService.GroomingCode = GroomingCode;
      Notes           : String(50);
      Date            : Date;
      Time            : Time;
      to_PetCare      : Association to PetCare;
};

//
//  Code Lists
//

// entity Pet_MedicalServiceTypes : sap.common.CodeList {
//   key code : String enum {
//         Vaccinations      = 'VA';
//         Deworming         = 'DE';
//         FleaTreatment     = 'FL';
//         RabiesVaccination = 'RA'
//       };
// };

// entity Pet_MedicalTypes : sap.common.CodeList {
//   key code : String enum {
//         Public  = 'PU';
//         Private = 'PR'
//       };
// };
