using { sap.fe.cap.petcare as my } from '../db/schema';

service PetCareService @(path:'/processor', requires: 'authenticated-user') {

@odata.draft.enabled
  entity PetCare as projection on my.PetCare actions {
    action rejectTravel();
    action acceptTravel();
  };

  // Ensure all masterdata entities are available to clients
  annotate my.MasterData with @cds.autoexpose @readonly;
}
