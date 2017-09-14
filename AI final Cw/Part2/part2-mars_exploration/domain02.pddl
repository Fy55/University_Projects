(define (domain domain02)
    (:requirements
        :strips :equality
    )

    (:predicates
        (faceEarth ?x)
        (faceMars ?x)
        (site ?x)
        (soilcomp ?x ?y) ;soilcomp test performed by x(rover) on y(site)
        ;(getResults ?x ?y)
        (path ?x ?y)
        (rover ?r)
        (comsat ?x)
        (location ?x ?l)
        (getMessage ?x)
        (getTest ?x)
        (testEmpty ?x ?y)
        (getTestResults ?x ?y)
        (earth ?x)
        
    )

    (:action explore_sites
    :parameters
        (?r1 ?l1 ?l2)
    :precondition 
(and 
   
    (rover ?r1)
    (location ?r1 ?l1)
    (path ?l1 ?l2)
    (testEmpty ?r1 ?l2)

)
    :effect
        (and 
            (not (location ?r1 ?l1))
            (location ?r1 ?l2)
            
            )
    )

(:action send_message_comsat_rover
    :parameters
        (?r1 ?r2 ?l2 ?l1 ?c)
    :precondition 
(and 
    (faceMars ?c)                    ;comsat facing mars
    (rover ?r1)
     (rover ?r2)
    (location ?r1 ?l2) ;rover at site2
    (location ?r2 ?l1) 
    (testEmpty ?r1 ?l2)
    (testEmpty ?r2 ?l1)
)
    :effect
        (and 
            (getMessage ?r1)
            (getMessage ?r2)
    )
)
(:action perform_test
    :parameters
        (?r1 ?r2 ?l1 ?l2 ?c)
    :precondition 
(and 
   ;(faceMars ?c)                   ;comsat facing mars
    (rover ?r1)
    (rover ?r2)
    (location ?r1 ?l2)              ;rover at site2
    (getMessage ?r1)
    (testEmpty ?r1 ?l2)
    (testEmpty ?r2 ?l1)
)
    :effect
        (and (not(testEmpty ?r1 ?l2))
             (not(testEmpty ?r2 ?l1))
            ;(soilcomp ?r1 ?l2)
            (getTest ?r1)
            (getTest ?r2)
    )
)
(:action send_results_rover
    :parameters
        (?r1 ?r2 ?l1 ?l2 ?c)
    :precondition 
(and 
   (faceMars ?c)                     ;comsat facing mars
    (rover ?r1)
    (rover ?r2)
    (location ?r1 ?l2)  
     (location ?r2 ?l1) 
     ;rover at site2
    (getMessage ?r1)
    (getMessage ?r2)
    (getTest ?r1)
    (getTest ?r2)
)
    :effect
        (and ;(not(testEmpty ?r1))
            ;(soilcomp ?r1 ?l2)
            
          (getTestResults ?r1 ?c)
          (getTestResults ?r2 ?c)
    )
)
(:action send_Testresults_missioncontrol
    :parameters
        (?r1 ?r2 ?l1 ?l2 ?c ?e)
    :precondition 
(and 
    (earth ?e)
   (faceEarth ?c)                     ;comsat facing mars
    (rover ?r1)
    (rover ?r2)
    (location ?r1 ?l2) 
    (location ?r2 ?l1) 
    ;rover at site2
   ; (getMessage ?r1)
     (getTestResults ?r1 ?c)
     (getTestResults ?r2 ?c)
)
    :effect
        (and ;(not(testEmpty ?r1))
            ;(soilcomp ?r1 ?l2)
            
            (getTestResults ?r1 ?e)
            (getTestResults ?r2 ?e)
    )
)
)