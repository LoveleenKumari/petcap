sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/fe/app/petapp/test/integration/FirstJourney',
		'sap/fe/app/petapp/test/integration/pages/PetCareList',
		'sap/fe/app/petapp/test/integration/pages/PetCareObjectPage'
    ],
    function(JourneyRunner, opaJourney, PetCareList, PetCareObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/fe/app/petapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePetCareList: PetCareList,
					onThePetCareObjectPage: PetCareObjectPage
                }
            },
            opaJourney.run
        );
    }
);