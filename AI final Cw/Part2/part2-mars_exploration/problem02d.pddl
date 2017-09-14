(define (problem problem02d)
  (:domain domain02)
  
  (:objects
      
    rover1
    rover2
      
    site1
    site2
    site3
      
    comsat
    testEmpty
    getTest
    getTestResults
     
    getMessage

    earth
    soilcomp
    faceMars
    
      
      
  )
  
  (:init
    (rover rover1)
    (rover rover2)
   
    (faceMars comsat)
    (faceEarth comsat)
    
    (earth earth)   
    
    (testEmpty rover1 site2)
   ;(testEmpty rover2 site2)
    (testEmpty rover2 site3)
   ; (testEmpty rover2 site1)
      
    (site site1)
    (site site2)
    (site site3)

    (comsat comsat)
      
    (location rover1 site1)
    (location rover2 site2)
    ;(location rover2 site3)
    
    
    
        
    ;(rover site1)
    (path site1 site2)
    (path site2 site3)
    ;(path site3 site1)
    
   ; (soilcomp rover1 site2)
      
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
        (location rover2 site3)
       ; (location rover2 site1)
       
       ; (getTest rover2 site3)
        (getMessage rover1)
        (getMessage rover2)
        
        (getTestResults rover1 comsat)
        (getTestResults rover2 comsat)
        
        (getTestResults rover1 earth)   
        (getTestResults rover2 earth)
            
      )
  )
)