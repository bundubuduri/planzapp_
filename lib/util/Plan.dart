

class Plan {
  var planEventPlanners = [];
  var planUserEmail = "";
  var planTitle = "";
  var planPrice = "";
  var planImage;
  var planDescription = "";
  var planInternalUsers = [];
//  var internalUsers = InternalUser("","","");
  //InternalUser planInternalUsers = InternalUser("","","");
  var planExternalUsers = [];
  var planPlacesWithTime = [];
  var planStatus = "Planning";
  var planFavorite = false;
  var planFavoriteTime = "";

  var cameFromViewItineraryPage = false;

  var planId = "";

  Plan({
    var planEventPlanners,
    var planUserEmail,
    var planTitle,
    var planPrice,
    var planImage,
    var planDescription,
    var planInternalUsers,
    var planExternalUsers,
    var planPlacesWithTime,
    var planStatus,
    var planFavorite,
    var planFavoriteTime,
    var cameFromViewItineraryPage,
    var planId}){
    if(planEventPlanners != null){
      this.planEventPlanners = planEventPlanners;
    }
    if(planUserEmail != null){
      this.planUserEmail = planUserEmail;
    }
    if(planTitle != null){
      this.planTitle = planTitle;
    }
    if(planPrice != null){
      this.planPrice = planPrice;
    }
    if(planImage != null){
      this.planImage = planImage;
    }
    if(planDescription != null){
      this.planDescription = planDescription;
    }
    if(planInternalUsers != null){
      this.planInternalUsers = planInternalUsers;
    }
    if(planExternalUsers != null){
      this.planExternalUsers = planExternalUsers;
    }
    if(planPlacesWithTime != null){
      this.planPlacesWithTime = planPlacesWithTime;
    }
    if(planStatus != null){
      this.planStatus = planStatus;
    }
    if(planFavorite != null){
      this.planFavorite = planFavorite;
    }
    if(planFavoriteTime != null){
      this.planFavoriteTime = planFavoriteTime;
    }
    if(cameFromViewItineraryPage != null){
      this.cameFromViewItineraryPage = cameFromViewItineraryPage;
    }
    if(planId != null){
      this.planId = planId;
    }

  }

  List show() {
    return [planEventPlanners,
      planUserEmail,
      planTitle,
      planPrice,
      planImage,
      planDescription,
      planInternalUsers,
      planExternalUsers,
      planPlacesWithTime,
      planStatus,
      planFavorite,
      planFavoriteTime,
      cameFromViewItineraryPage,
      planId];
  }


}

