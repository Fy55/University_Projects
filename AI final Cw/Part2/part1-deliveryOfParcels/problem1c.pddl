(define (problem problem1c)
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
   
   (location robot david)
   
  ; (raining)
   ;(not(wet))
   (location parcel1 lyell)
   (location parcel2 david)
   (location parcel3 earl)
   (location umbrella earl)
   ;(not(doorOpen))
   (handEmpty)
  ; (not(raining))
   
  

   )

   (:goal
   		(and
   		   
   		   ;(doorOpen)
   		   (onFloor parcel1)
   		   (onFloor parcel3)
   		   (location parcel1 earl)
   		   (location parcel3 lyell)
   		   ;(handEmpty)
   		   ;(not(wet))
   		   (location robot david)
   		)
    )
)

