# Tendable_iOSExercise

## Assessment Description:
- The application is designed to facilitate various inspections, with each inspection type involving multiple questions. Each
question offers at least 2 answer choices, ranging in value from 0 to 1. An option for 'Not Applicable' (N/A) answers is also
available. Every question must be answered with a single answer to allow an inspection to be submitted to the system.
- Inspections could be completed offline and submitted upon completion. Inspectors can save partial inspections and resume them
later. Inspections are tied to specific areas within the organization, with each type of inspection scheduled at regular
intervals. Upon completion, the app calculates and displays the final inspection score by summing up the scores of all answered
questions. 
- Users can access past inspection results and view upcoming inspections. 
- Key Features:
  1. User authentication via login.
  2. Initiate an inspection using the 'start' endpoint of the local webserver.
  3. Save inspections in a persistent storage, accommodating both draft and completed states.
  4. Finalize and submit inspections using the 'submit' endpoint of the local webserver.


## Notes from Developer:
**Integrated:**
- UI of authentication, i.e `login` and `registration` 
- UI of Inspection categories list
- UI of Questions list
- APIs integration of authentication
- APIs integration of inspections
- Unit test cases of authentication
- Unit test cases of inspections

**Pending:**
- Validation of login/registration inputs
- Local data storage integration  

**Note:**
- Registration API throws error for `password` field

