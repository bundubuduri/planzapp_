const functions = require('firebase-functions');

// The Firebase Admin SDK to access Firestore.
const admin = require('firebase-admin');
const nodemailer = require('nodemailer');
const cors = require('cors')({origin: true});

admin.initializeApp();

//exports.makeNotification = functions.firestore.document('User/')

// Trigger plan created, notify users plan invite
//function triggerNewPlan() {
  // [START trigger_new_document]
  exports.createPlanInviteNotification = functions.firestore.document('Plans/{planID}').onCreate(async (snap, context) => {
    const FieldValue = admin.firestore.FieldValue;
    const planInternalUsers = snap.data().planInternalUsers;
    const planId = snap.data().planId;
    const planTitle = snap.data().planTitle;
    const planEventPlanners = snap.data().planEventPlanners;
    const planPrice = snap.data().planPrice;
    const planDescription = snap.data().planDescription;
    const planExternalUsers = snap.data().planExternalUsers;
    const planPlacesWithTime =  snap.data().planPlacesWithTime;
    const planStatus =  snap.data().planStatus;
    const planFavorite =  snap.data().planFavorite;
    const planFavoriteTime = snap.data().planFavoriteTime;

    for (var i = 0; i < planInternalUsers.length; i++){
      // Push the new message into Firestore using the Firebase Admin SDK.
      var randomId = makeid(16);

      console.log(internalUsers[i]);
      const notification = admin.firestore().collection('User/' + planInternalUsers[i] + '/Notifications'); 
      await notification.doc(randomId).set(
      {type: 'invite',
       planTitle: planTitle,
        planId: planId,
         timestamp: FieldValue.serverTimestamp(),
       planInternalUsers : planInternalUsers,
       planId : planId,
       planEventPlanners : planEventPlanners,
       planPrice : planPrice,
       planDescription : planDescription,
       planExternalUsers : planExternalUsers,
       planPlacesWithTime : planPlacesWithTime,
       planStatus : planStatus,
       planFavorite : planFavorite,
       planFavoriteTime : planFavoriteTime,
       userViewed : false,
       notificationId : randomId,

         });

    }

    //RandomID generator 
    function makeid(length) {
      var result  = '';
      var characters  = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
      var charactersLength = characters.length;
      for ( var i = 0; i < length; i++ ) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
      }
      return result;
    }


  }) 
//}

// Deleted plan notification
exports.deletedPlanNotification = functions.firestore.document('Plans/{planID}').onDelete(async (snap, context) => {
  const deletedDocument = snap.data
  const FieldValue = admin.firestore.FieldValue;
  
  const planInternalUsers = snap.data().planInternalUsers;
  const planId = snap.data().planId;
  const planTitle = snap.data().planTitle;
  const planEventPlanners = snap.data().planEventPlanners;
  const planPrice = snap.data().planPrice;
  const planDescription = snap.data().planDescription;
  const planExternalUsers = snap.data().planExternalUsers;
  const planPlacesWithTime =  snap.data().planPlacesWithTime;
  const planStatus =  snap.data().planStatus;
  const planFavorite =  snap.data().planFavorite;
  const planFavoriteTime = snap.data().planFavoriteTime;

  for (var i = 0; i < planInternalUsers.length; i++){
      // Push the new message into Firestore using the Firebase Admin SDK.
      var randomId = makeid(16);

      console.log(internalUsers[i]);
    const notification = admin.firestore().collection('User/' + planInternalUsers[i] + '/Notifications'); 
      await notification.doc(randomId).set(
      {type: 'delete',
       planTitle: planTitle,
        planId: planId,
         timestamp: FieldValue.serverTimestamp(),
       planInternalUsers : planInternalUsers,
       planId : planId,
       planEventPlanners : planEventPlanners,
       planPrice : planPrice,
       planDescription : planDescription,
       planExternalUsers : planExternalUsers,
       planPlacesWithTime : planPlacesWithTime,
       planStatus : planStatus,
       planFavorite : planFavorite,
       planFavoriteTime : planFavoriteTime,
       userViewed : false,
       notificationId : randomId,

         });
    }

    //RandomID generator 
    function makeid(length) {
      var result  = '';
      var characters  = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
      var charactersLength = characters.length;
      for ( var i = 0; i < length; i++ ) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
      }
      return result;
    }
})

// Updated plan notification
exports.updatedPlanNotification = functions.firestore.document('Plans/{planID}').onUpdate(async (change, context) => {
  const newValue = change.after.data();
  const FieldValue = admin.firestore.FieldValue;
  
  const planInternalUsers = newValue.planInternalUsers;
  const planId = newValue.planId;
  const planTitle = newValue.planTitle;
  const planEventPlanners = newValue.planEventPlanners;
  const planPrice = newValue.planPrice;
  const planDescription = newValue.planDescription;
  const planExternalUsers = newValue.planExternalUsers;
  const planPlacesWithTime =  newValue.planPlacesWithTime;
  const planStatus =  newValue.planStatus;
  const planFavorite =  newValue.planFavorite;
  const planFavoriteTime = newValue.planFavoriteTime;

  for (var i = 0; i < planInternalUsers.length; i++){
      // Push the new message into Firestore using the Firebase Admin SDK.
      var randomId = makeid(16);

    console.log(planInternalUsers[i]);
    const notification = admin.firestore().collection('User/' + planInternalUsers[i] + '/Notifications'); 
      await notification.doc(randomId).set(
      {type: 'change',
       planTitle: planTitle,
        planId: planId,
         timestamp: FieldValue.serverTimestamp(),
       planInternalUsers : planInternalUsers,
       planId : planId,
       planEventPlanners : planEventPlanners,
       planPrice : planPrice,
       planDescription : planDescription,
       planExternalUsers : planExternalUsers,
       planPlacesWithTime : planPlacesWithTime,
       planStatus : planStatus,
       planFavorite : planFavorite,
       planFavoriteTime : planFavoriteTime,
       userViewed : false,
       notificationId : randomId,

         });
    }

    //RandomID generator 
    function makeid(length) {
      var result  = '';
      var characters  = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
      var charactersLength = characters.length;
      for ( var i = 0; i < length; i++ ) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
      }
      return result;
    }
})

// Copy and rename User documents, subcollections, and subdocuments
exports.renameUserDocs = functions.https.onRequest(async (request, response) => {

  const _datarwt = [];
  const usersSnapshot = await admin.firestore().collection('User').get();
  if (usersSnapshot.empty) {
    console.log('No matching documents.');
  }

  // loop through User Documents
  usersSnapshot.forEach(async doc => {
    let docRef = admin.firestore().collection('User').doc(doc.id);
   //  Create new document in Users based on UserId
    const userDoc = await admin.firestore().collection('User').doc(doc.data().user_id).set(doc.data());

    // write notifications to new area
    const notifSnapshot = await docRef.collection('Notifications').get();
    notifSnapshot.forEach(async notif => {
      _datarwt.push( admin.firestore().collection('User').doc(doc.data().user_id).collection('Notifications').doc(notif.id).set(notif.data()));
      });

    // write preferences to new area
    const prefSnapshot = await docRef.collection('Preferences').get();
    prefSnapshot.forEach(async pref => {
      _datarwt.push( admin.firestore().collection('User').doc(doc.data().user_id).collection('Preferences').doc('Preferences').set(pref.data()));
    });
  })
  const _dataloaded = await Promise.all( _datarwt );

  response.send("renameUserDocs completed!");
});

exports.addPrefNotifFolders = functions.https.onRequest(async (request, response) => {

  const _datarwt = [];
  const FieldValue = admin.firestore.FieldValue;
  const usersSnapshot = await admin.firestore().collection('User').get();
  if (usersSnapshot.empty) {
    console.log('No matching documents.');
  }

  // loop through User Documents
  usersSnapshot.forEach(async doc => {

    // write notifications to new area
    var randomId = makeid(16);

    //const notification = admin.firestore().collection('User/' + internalUsers[i] + '/Notifications'); 
    _datarwt.push(
      admin.firestore().collection('User/' + doc.id + '/Notifications').doc(randomId).set(
      {type: 'invite',
       planTitle: 'Welcome',
       planId: '00000000',
       timestamp: FieldValue.serverTimestamp(),
       planInternalUsers : [],
       planId : "",
       planEventPlanners : [],
       planPrice : '0',
       planDescription : "Welcome to planzApp.",
       planExternalUsers : [],
       placesWithTime : '',
       planStatus : 'Not Started',
       planFavorite : false,
       planFavoriteTime : '',
       userViewed : false,
       notificationId : randomId,

      }));

    // write preferences to new area
    //const preferences = admin.firestore().collection('User/' + internalUsers[i] + '/Preferences');
    _datarwt.push(admin.firestore().collection('User/' + doc.id + '/Preferences').doc('Preferences').set({comfy : true}));
    
  })

  //RandomID generator 
  function makeid(length) {
    var result  = '';
    var characters  = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for ( var i = 0; i < length; i++ ) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
  }

  const _dataloaded = await Promise.all( _datarwt );
  response.send("PrefNotifs completed!");

});

// Update plan documents
exports.updatePlanDocs = functions.https.onRequest(async (request, response) => {

  const plansSnapshot = await admin.firestore().collection('Plans').get();
  if (plansSnapshot.empty) {
    console.log('No matching documents');
  }

  // loop through Plans Documents
  plansSnapshot.forEach(async docum => {
    const plan = admin.firestore().collection('Plans'); 
    await plan.doc(docum.id).update(
      {
        planDescription: docum.data().description,
        planEventPlanners: docum.data().eventPlanners,
        planExternalUsers: docum.data().externalUsers,
        planFavorite: docum.data().favorite,
        planFavoriteTime: docum.data().favoriteTime,
        planInternalUsers: docum.data().internalUsers,
        planPlacesWithTime: docum.data().placesWithTime,
        planPrice: docum.data().price,
        planStatus: docum.data().status,
        //planTitle: docum.data().title,
      });
  });
  response.send("Update plan docs completed!");

});

// Function for sending emails to anyone(most likely not on the app)
let transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: 'admin@planzapp.app',
        pass: '&@Nbq#9Gv$2021#'
    }
});

exports.sendMail = functions.https.onRequest((req, res) => {
    cors(req, res, () => {

        // getting dest email by query string
        const dest = req.query.dest;

        const mailOptions = {
            from: 'planzapp Admin <uchenna@planzapp.app>', // Something like: Jane Doe <janedoe@gmail.com>
            to: dest,
            subject: 'Invitation to planzapp', // email subject
            html: `<p style="font-size: 16px;">Hi , You have been invited to join planzapp, please click the link below to get started.</p>
                <br />
                <img src="https://images.prod.meredith.com/product/fc8754735c8a9b4aebb786278e7265a5/1538025388228/l/rick-and-morty-pickle-rick-sticker" />
            ` // email content in HTML
        };

        // returning result
        return transporter.sendMail(mailOptions, (erro, info) => {
            if(erro){
                return res.send(erro.toString());
            }
            return res.send('Message Sent');
        });
    });
});

//password reset email
exports.sendResetMail = functions.https.onRequest((req, res) => {
    cors(req, res, () => {

        // getting dest email by query string
        const dest = req.query.dest;

        const mailOptions = {
            from: 'planzapp Admin <uchenna@planzapp.app>', // Something like: Jane Doe <janedoe@gmail.com>
            to: dest,
            subject: 'Reset your password for planzApp', // email subject
            html: `<p style="font-size: 16px;">Hello, Follow this link to reset your planzApp password for you account.</p>
                <br/>
                <a href="https://planzapp-2c02d.firebaseapp.com/__/auth/action?mode=action&oobCode=code">Reset Password</a>
            ` // email content in HTML
        };

        // returning result
        return transporter.sendMail(mailOptions, (erro, info) => {
            if(erro){
                return res.send(erro.toString());
            }
            return res.send('Message Sent');
        });
    });
});

// Add favoritePlans data array to User documents
exports.addFavoritePlans = functions.https.onRequest(async (request, response) => {

  const _datarwt = [];
  const usersSnapshot = await admin.firestore().collection('User').get();
  if (usersSnapshot.empty) {
    console.log('No matching documents.');
  }

  // loop through User Documents
  usersSnapshot.forEach(async doc => {
    let docRef = admin.firestore().collection('User').doc(doc.id);

    _datarwt.push( admin.firestore().collection('User').doc(doc.id).update({favoritePlans: []}));

  })
  const _dataloaded = await Promise.all( _datarwt );

  response.send("addFavoritePlans completed!");
});
