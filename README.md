SchoolStop - README Template
===

# SchoolStop

## Table of Contents 
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
This is an app that lets you keep track of all of your school-related needs.
### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Education
- **Mobile:** Users have access to many tools they can use in school such as access to YouTube tutorial videos, assignment checklists, among others.
- **Story:** Users will be able to use tools that create a better learning experience for teachers and students.
- **Market:** For people who need to stay organized. For people who want to know how they are doing in their classes and what they need to do to improve their performance in school.
- **Habit:** It helps students stay organized daily and can get reminders to do assignments, and have access to student resources to get caught up or get ahead in the classroom.  
- **Scope:** This app will start off with just being able to post photos to share with other users (students/teachers). This allows students and teachers to communicate with one another through photos.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Users can view a scrolling list of reminders needed to get done for their classes
* Users can add/remove items to the scrolling list of reminders 
* Users can view up to 10 reminders on their list of reminders
* Users can view a feed of posts (of 10 posts) that contain photos of their homework/assignments 
* Users can post photos of their assignments to the feed of homework/assignments
* Users can view their current grade on the screen
* Users can calculate the minimum required grade they need (using Rogerhub's Final Grade Calculator as a base) on a final exam to earn a target grade.
* Users can search for video tutorial links using the YouTube API 
* Users can view selected videos from a scrolling list to get help on certain homework assignments

**Optional Nice-to-have Stories**

* Users can view many reminders through the use of infinite scroll
* Users can like posts that appear in their feed
* Users can comment on posts seen in their feed
* Users can view a feed of many posts using infinite scroll
* Users can view the graded assignments to view how their average grade is calculated
* Users can view YouTube videos in landscape mode

### 2. Screen Archetypes

Video Tutorial Screen
 * Users can search for video tutorial links using the YouTube API 
 * Users can view selected videos from a scrolling list to get help on certain homework assignments 

To-Do Screen
 * Users can view a scrolling list of reminders needed to get done for their classes
 * Users can add/remove items to the scrolling list of reminders
 * Users can view up to 10 reminders on their list of reminders 

Grade Calculator Screen
   * Users can view their current, up-to date grades.
   * Users can calculate the minimum required grade they need (using something similar to Rogerhub's Final Grade Calculator) on a final exam to earn a certain target grade.

Support/Posts Screen
  * Users can view a feed of posts (of 10 posts) that contain photos of their homework/assignments
  * Users can post photos of their assignments to the feed of homework/assignments

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Video Tutorial
* To-Dos
* Grade Calculator
* Support/Posts

**Flow Navigation** (Screen to Screen)
* Video Tutorial
   * Users will be presented with a list of suggested videos as well as a search bar to look up other YouTube video tutorials.
   * When user searches up a keyword (or keywords), they will be presented with appropriate YouTube videos that match up their search request, and can view those selected videos.
* To-Dos
   * Users can scroll through a list of to-dos for their assignments. 
   * Users can add in reminders for their assignments.
   * Users can edit their reminders and check off reminders to label them as complete.
* Grade Calculator
   * Users can view their current, up-to date grades.
   * Users can calculate the minimum required grade they need (using something similar to Rogerhub's Final Grade Calculator) on a final exam to earn a certain target grade.

* Support/Posts
   * Users can post photos of their assignments to the feed of homework/assignments.
   * Users can respond to one another through their own support threads started by users.
  
## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups
![](https://i.imgur.com/qhV0WXc.png)


### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
- Support/Posts Screen
    - Home Feed Screen
         ```swift
         let query = PFQuery(className:"Post")
         query.whereKey("author", equalTo: currentUser)
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let posts = posts {
               print("Successfully retrieved \(posts.count) posts.")
           // TODO: Do something with posts...
            }
         }
         ```

### POST

- Base URL - [https://api.got.show/api](https://api.got.show/api)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /numLikes | gets # of likes 
    `GET`    | /user/byId/:id | gets specific user by :id
    `GET`    | /comments | gets all comments
    `GET`    | /imgURL | gets image URL 
    
### Networking
##### YouTube
- Base URL - [https://api.got.show/api](https://api.got.show/api)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /youtubeKey | gets key for video link

- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]