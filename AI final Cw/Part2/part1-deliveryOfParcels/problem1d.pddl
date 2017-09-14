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
   (location parcel2 earl)
   (location parcel3 lyell)
   ;(location umbrella earl)
   
  

   )

   (:goal
   		(and
   		   
   		   (onFloor parcel1)
   		   (location parcel1 lyell)
   		   (onFloor parcel2)
   		   (location parcel2 david)
   		   (onFloor parcel3)
   		   (location parcel3 earl)
   		  ; (not(holding parcel1))
   		    (location robot lyell)
   		    
   		   ;(holding umbrella)
   		    ;(not(wet))
   		)
    )
)