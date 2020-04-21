# IndustryJobs

IndustryJobs is a job application based portal where applicants can apply through their name & email (without need to login). The job posters can post the jobs, check the applications and schedule interview based on those applications. The applicant will recieve an email once the interview is scheduled. The applicant can choose to accept or reject the interview and the decision will be shown to job posters.

* Ruby version: 2.5.1p57
* Rails version: 5.2.0

## Demo
* Heroku Demo link: https://fast-depths-56174.herokuapp.com/
* Heroku Admin email: steven.hart@industryprime.com, password: password

## Screenshots
* Candidate will visit this Job post and apply against a job with their Name and Email address.
![IndustryJobs (6)](https://user-images.githubusercontent.com/7859906/79827835-05f19f00-83bd-11ea-9420-fa46a9696a70.png)

* Organisation User Sign-in
![IndustryJobs (1)](https://user-images.githubusercontent.com/7859906/79827808-f07c7500-83bc-11ea-8fa8-e07ad2a1a240.png)

* Jobs posted by Organisation
![IndustryJobs (2)](https://user-images.githubusercontent.com/7859906/79827793-e5c1e000-83bc-11ea-99a0-f917a2e711d4.png)

* Applications recieved by Organisation
![IndustryJobs (3)](https://user-images.githubusercontent.com/7859906/79827776-d80c5a80-83bc-11ea-8ad1-7f6f836e1ecd.png)

* Organisation User can schedule an interview
![IndustryJobs (4)](https://user-images.githubusercontent.com/7859906/79827757-cc209880-83bc-11ea-8c1f-6523a93522f8.png)

* Organisation User can check the scheduled interviews to be taken
![IndustryJobs (5)](https://user-images.githubusercontent.com/7859906/79827736-bc08b900-83bc-11ea-9492-67f513a7cb0c.png)

## Requirements

* There should be two type Users. i) Admin User, ii) Organisation User
* An organisation user can create multiple job vacancies for own organisation. 
* After creating job vacancies, Admin user will approve and then this vacancy will appear in the job list. 
* Job list is a news feed. Job Posts will appear there in newer-to-older order. 
* Candidate will visit this Job post and apply against a job with their Name and Email address. 
* One candidate could apply for a job once. 
* Organisation user could see applicants list and invite them for Interview. 
* When an Organisation user is inviting for an interview there will be an option to set the Date and Time of the interview.
* After that one mail will go to the applicant. 
* In this mail, there should be two options. i) Accept, ii) Reject. 
* If Applicant accepts this invitation then nothing to do, just show a message. If the applicant rejects this invitation then ask for a reason. Applicant actions will reflect in the applicant's list. 
* In applicants list, there will be Three type of filters.
  * Status wise (i.e. Invitation sent, Invitation Not Sent),
  * Response status wise (i.e. Accepted or Rejected),
  * Jobs title wise filter.
* Make sure multiple filters work at a time.

## Dependencies

* Admin User cannot be registered from the frontend for security purpose.
* Created 1 admin user from the backend for your convenience.
  * Admin User Email: steven.hart@industryprime.com
  * Admin Password: password

* Company/Organization will be created by Admin only.
* Then Organization User can choose their company name while registration.

