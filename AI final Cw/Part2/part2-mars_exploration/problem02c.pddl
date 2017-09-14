(define (problem problem02)
  (:domain domain02)
  
  (:objects
      
    rover1
    rover2
      
    site1
    site2
    site3
    site4
    site5
      
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
    ;(faceEarth comsat)
    
    (earth earth)   
    
    (testEmpty rover1 site2)
    ;(testEmpty rover2 site2)
    (testEmpty rover2 site3)
    (testEmpty rover2 site1)
    (testEmpty rover2 site4)
    (testEmpty rover2 site5)
      
    (site site1)
    (site site2)
    (site site3)
    (site site4)
    (site site5)
    

    (comsat comsat)
      
    (location rover1 site1)
    (location rover2 site2)
    (location rover2 site3)
    ;(location rover2 site4)
    ;(location rover2 site5)
    

    
    
        
    ;(rover site1)
    (path site1 site2)
    (path site2 site3)
    (path site3 site1)
    (path site3 site4)
    (path site4 site5)
    
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
        ;(location rover2 site3)
        (location rover2 site1)
        (location rover2 site5)
       
        
        (getTest rover2 site3)
       ; (getTest rover1 site2)
      ;  (not(getTest rover2 site2))
        ;(getTest rover2 site1)
        (getTest rover2 site4)
        (getTest rover2 site5)
        
        
        (getMessage rover1)
        (getMessage rover2)
        ;(getMessage rover2)
        
        (getTestResults rover1 comsat)
        (getTestResults rover2 comsat)
       ;(getTestResults rover2 comsat)
        
        (getTestResults rover1 earth)   
        (getTestResults rover2 earth)
        ;(getTestResults rover2 earth)
            
      )
  )
)