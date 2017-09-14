(define (problem problem02a)
  (:domain domain02)
  
  (:objects
      
    rover1
    rover2
      
    site1
    site2
      
    comsat
    testEmpty
    getTest
    getTestResults
     
    getMessage

    earth
    soilcomp
    faceMars
     ; soilcomp
     ; getResults
      
      
  )
  
  (:init
    (rover rover1)
    (rover rover2)
    (faceMars comsat)
    (faceEarth comsat)
    (earth earth)   
    (testEmpty rover1 site2)
        
       ; (getTest getTest)
      
    (site site1)
    (site site2)

    (comsat comsat)
      
    (location rover1 site1)
        
    ;(compsat faceEarth)
    ;(rover testEmpty)
        
    ;(rover site1)
    (path site1 site2)
   (soilcomp rover1 site2)
   (soilcomp rover1 site2)
      
  )
  
  (:goal
      (and
          ;(rover getResults)
          ;(rover sendMessage) ;change for rover>comp communication and comp>mission control
          ;(compsat faceMars)
          ;(compsat sendmessage)
          ;(compsat faceEarth)
          ;(earth getResults)
        (location rover1 site2)
        (getMessage rover1)
        (getTestResults rover1 comsat)
        (getTestResults rover1 earth)   
            
      )
  )
)