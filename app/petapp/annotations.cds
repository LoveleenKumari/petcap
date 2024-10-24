using PetCareService as service from '../../srv/pet-care';
using from '../../db/master-data';
using from '../../db/schema';


annotate service.PetCare with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Gender}',
                Value : Gender,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Dob1}',
                Value : DOB,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Colour',
                Value : Colour,
            },
            {
                $Type : 'UI.DataField',
                Value : to_PetType.PetType,
            },
            {
                $Type : 'UI.DataField',
                Value : to_BreedType.Breed,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>GeneralInformation}',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Vaccination}',
            ID : 'Medical',
            Target : 'to_PetMedicaL/@UI.LineItem#Medical',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Nutrition}',
            ID : 'Nutrition',
            Target : 'to_PetNutrition/@UI.LineItem#Nutrition',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Grooming}',
            ID : 'i18nGrooming',
            Target : 'to_PetGrooming/@UI.LineItem#i18nGrooming',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Petid}',
            Value : PetID,
        },
        {
            $Type : 'UI.DataField',
            Value : Name,
        },
        {
            $Type : 'UI.DataField',
            Value : Gender,
        },
        {
            $Type : 'UI.DataField',
            Value : Colour,
        },
        {
            $Type : 'UI.DataField',
            Value : DOB,
        },
        {
            $Type : 'UI.DataField',
            Value : to_BreedType.Breed,
        },
        {
            $Type : 'UI.DataField',
            Value : to_PetType.PetType,
        },
    ],
    UI.SelectionFields : [
        Name,
        PetID,
        to_BreedType.Breed,
        to_PetType.PetType,
        Gender,
        Colour,
        DOB,
    ],
    UI.HeaderInfo : {
        TypeName : '{i18n>PetDetails}',
        TypeNamePlural : '{i18n>PetDetails}',
        Title : {
            $Type : 'UI.DataField',
            Value : PetID,
        },
        ImageUrl : PetPicURL,
    },
    UI.HeaderFacets : [
        
    ],
    UI.FieldGroup #PetDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.DataPoint #PetID : {
        $Type : 'UI.DataPointType',
        Value : PetID,
        Title : 'PetID',
    },
);

annotate service.PetCare with {
    Name @Common.Label : '{i18n>Name}'
};

annotate service.PetCare with {
    PetID @Common.Label : '{i18n>Petid}'
};

annotate service.BreedType with {
    Breed @Common.Label : '{i18n>Breed}'
};

annotate service.PetType with {
    PetType @Common.Label : '{i18n>Pettype}'
};

annotate service.PetCare with {
    Gender @Common.Label : '{i18n>Gender}'
};

annotate service.PetCare with {
    Colour @Common.Label : '{i18n>Colour}'
};

annotate service.PetCare with {
    DOB @Common.Label : '{i18n>Dob1}'
};

annotate service.Pet_Medical with @(
    UI.LineItem #Medical : [
        {
            $Type : 'UI.DataField',
            Value : to_PetCare.to_PetMedicaL.Service.descr,
            Label : '{i18n>Service}',
        },
        {
            $Type : 'UI.DataField',
            Value : to_PetCare.to_PetMedicaL.Title,
            Label : '{i18n>Title}',
        },
        {
            $Type : 'UI.DataField',
            Value : to_PetCare.to_PetMedicaL.Notes,
            Label : '{i18n>Notes}',
        },
        {
            $Type : 'UI.DataField',
            Value : to_PetCare.to_PetMedicaL.VaccinationDate,
            Label : '{i18n>VaccinationDate}',
        },
        {
            $Type : 'UI.DataField',
            Value : VaccinationExpiryDate,
            Label : '{i18n>VaccinationExpiryDate}',
        },
        {
            $Type : 'UI.DataField',
            Value : to_PetCare.to_PetMedicaL.MedicalType.descr,
            Label : '{i18n>MedicalType}',
        },
    ]
);

annotate service.Pet_Nutrition with @(
    UI.LineItem #Nutrition : [
        {
            $Type : 'UI.DataField',
            Value : to_PetCare.to_PetNutrition.FoodID,
            Label : 'FoodID',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : to_PetCare.to_PetNutrition.to_FoodItem.FoodItem,
            Label : 'FoodItem',
        },
        {
            $Type : 'UI.DataField',
            Value : to_PetCare.to_PetNutrition.Notes,
            Label : 'Notes',
        },
        {
            $Type : 'UI.DataField',
            Value : to_PetCare.to_PetNutrition.Date,
            Label : 'Date',
        },
        {
            $Type : 'UI.DataField',
            Value : to_PetCare.to_PetNutrition.Time,
            Label : 'Time',
        },
    ]
);

annotate service.Pet_Grooming with @(
    UI.LineItem #i18nGrooming : [
        {
            $Type : 'UI.DataField',
            Value : to_PetCare.to_PetGrooming.GroomingID,
            Label : 'GroomingID',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : to_PetCare.to_PetGrooming.to_GroomingService.GroomingService,
            Label : '{i18n>GroomingService}',
        },
        {
            $Type : 'UI.DataField',
            Value : to_PetCare.to_PetGrooming.Notes,
            Label : 'Notes',
        },
        {
            $Type : 'UI.DataField',
            Value : to_PetCare.to_PetGrooming.Date,
            Label : 'Date',
        },
        {
            $Type : 'UI.DataField',
            Value : to_PetCare.to_PetGrooming.Time,
            Label : 'Time',
        },
    ]
);

