(define (problem problem02b)
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
    (testEmpty rover2 site1)
    (testEmpty rover2 site3)
        
       ; (getTest getTest)
      
    (site site1)
    (site site2)
    (site site3)

    (comsat comsat)
      
    (location rover1 site1)
    (location rover2 site2)    
    
    ;(compsat faceEarth)
    ;(rover testEmpty)
        
    ;(rover site1)
    (path site1 site2)
    (path site2 site3)
    (path site3 site1)
    (path site2 site1)
    (location rover2 site3) 
    (soilcomp rover1 site2)
    (soilcomp rover2 site1)
    (soilcomp rover2 site3)
      
  )
  
  (:goal
      (and

        (location rover1 site2)
        (getMessage rover1)
        (getTestResults rover1 comsat)
        (getTestResults rover1 earth) 
        
        
        (location rover2 site3)
        (getMessage rover2)
        (getTestResults rover2 comsat)
        (getTestResults rover2 earth) 
        
        
        (location rover2 site1)
        (getMessage rover2)
        (getTestResults rover2 comsat)
        (getTestResults rover2 earth)
          
          
          
      )
  )
)