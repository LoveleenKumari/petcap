using {sap} from './common';

namespace sap.fe.cap.petcare;

aspect MasterData {}

entity PetProfile : MasterData {
    key PetID        : String(6);
        Name         : String(40);
        Gender       : String(1);
        DOB          : Date;
        Colour       : String(20);
        PetCode      : String(2);
        to_PetType   : Association to PetType
                           on to_PetType.PetCode = PetCode;
        to_BreedType : Association to BreedType
                           on to_BreedType.PetCode = PetCode;
        PetPicURL    : String @UI: {IsImageURL: true};
};

entity BreedType : MasterData {
    key PetCode : String(2);
        Breed   : String(40);
};

entity PetType : MasterData {
    key PetCode : String(2);
        PetType : String(40);
};

entity Pet_FoodItemTypes : MasterData {
  key FoodItemCode : String(2);
      FoodItem     : String(20);
};

entity Pet_GroomingServiceTypes : MasterData {
  key GroomingCode    : String(2);
      GroomingService : String(20);
};

entity Pet_MedicalServiceTypes : MasterData {
  key MedicalServiceTypeCode : String(2);
      MedicalServiceType     : String(20);
};

entity Pet_MedicalTypes : MasterData {
  key MedicalTypeCode : String(2);
      MedicalType     : String(20);
};


//
// Code Lists
//

// entity PetType : sap.common.CodeList {
//     key PetType : String enum {
//             Dog    = 'DO';
//             Cat    = 'CA';
//             Horse  = 'HO';
//             Cow    = 'CO';
//             Bovine = 'BO';
//             Ovine  = 'OV';
//             Parrot = 'PA';
//             Rabbit = 'RA';
//             Turtle = 'TU';
//             Fish   = 'FI';
//             Donkey = 'DO';
//             Rat    = 'RA';
//         };
// }
