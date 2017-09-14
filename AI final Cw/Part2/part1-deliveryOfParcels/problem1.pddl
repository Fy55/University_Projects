(define (problem problem1)
  (:domain domain1)

  (:objects

  	robot 
  	
  	earl
  	david
  	lyell

  	parcel1
  	parcel2
  	parcel3
  	
  	umbrella
  ;	door
  	path
  	

  )

   (:init
   
   (robot robot)
   ;(door door)
   (umbrella umbrella)
   (onFloor parcel1)
   (onFloor parcel2)
   (onFloor parcel3)
  (onFloor umbrella)
   
   (inside david earl)
   (inside earl david)
   
   (not(inside david lyell))
   (not(inside earl lyell))
   (not(inside lyell david))
   (not(inside lyell earl))
   
   (location robot earl)
   (handEmpty)
   (not(wet))
   (location parcel1 david)
   (location umbrella earl)
   
  

   )

   (:goal
   		(and
   		    (holding umbrella)
   		    (not(wet))
   		    (not(onFloor umbrella))
   		   ; (onFloor parcel1)
   		   (location parcel1 lyell)
   		   (not(holding parcel1))
   		    (location robot lyell)
   		    
   		   ;(holding umbrella)
   		    ;(not(wet))
   		)
    )
)