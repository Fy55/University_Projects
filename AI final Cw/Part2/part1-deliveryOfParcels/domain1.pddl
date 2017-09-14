(define (domain domain1)
    (:requirements
        :strips
    )

    (:predicates
        (handEmpty)
        (robot ?r)
        (parcel ?p)
        (holding ?x)
        (onFloor ?x)
        (location ?x ?y)
        (inside ?x ?y)
        (raining)
        (umbrella ?u)
        (wet)
        (doorOpen)
    )
    
    (:action move_bot_inside
        :parameters
            (?r ?l1 ?l2)
        :precondition 
            (and 
   
                (robot ?r)
                (location ?r ?l1)
                (not(location ?r ?l2))
                (inside ?l1 ?l2)
                (doorOpen)
    
            )
    :effect
        (and 
            (not (location ?r ?l1))
            (location ?r ?l2)
         
            
            )
    )
    
      (:action move_bot_outside
      :parameters
          (?r ?l1 ?l2)
      :precondition 
          (and 
 
              (robot ?r)
              (location ?r ?l1)
              (not(location ?r ?l2))
              (not(inside ?l1 ?l2))
              
    
          )
    :effect
        (and 
            (not (location ?r ?l1))
            (location ?r ?l2)
           )
   )
   
(:action open_door
        :parameters
             (?x ?r ?l1 ?l2)
        :precondition
            (and
             (robot ?r)
             ;(holding ?x)
             (location ?r ?l1)
             (not(location ?r ?l2))
             (inside ?l1 ?l2)
             (not(doorOpen))
             )
        :effect
            (and
             ;(onFloor ?x)
             (location ?r ?l2)
             (not(location ?r ?l1))
             (doorOpen)
        
             )
    )
       

    (:action pickup_item
        :parameters
             (?x ?r ?l2)
        :precondition
            (and
             (robot ?r)
             (handEmpty)
             (location ?r ?l2)
             (location ?x ?l2)
             (onFloor ?x)
             (not(holding ?x))
             )
        :effect
            (and
             (not (handEmpty))
            (not (onFloor ?x))
             (holding ?x)
             (location ?r ?l2)
             (location ?x ?l2)
        
             )
    )
    
 

(:action deliver_parcel
    :parameters
        (?x ?r ?l2)
    :precondition
        (and
            (not(handEmpty))
            (holding ?x)
            (location ?r ?l2)
            (not(onFloor ?x))
            
        )
    :effect
        (and
            (not (holding ?x))
            (onFloor ?x)
            (handEmpty)
            (location ?x ?l2)
            
        )
)
  (:action get_umbrella
      :parameters
          (?r ?l1 ?l2 ?u)
      :precondition 
          (and 
            (raining)
               (location ?r ?l1)
              (location ?u ?l1)
              (onFloor ?u)
              ;(not(inside ?l1 ?l2))
              (not(holding ?u))

          )
    :effect
        (and 
            (location ?r ?l1)
            (holding ?u)
            (not(wet))
           )
   )
   
   
     
)
