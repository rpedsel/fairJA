set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.6513, <2> 2.19, <3> 19.992, <4> 43.5701, <5> 8.788, <6> 26.0382, <7> 22.7819, <8> 36.3055, <9> 42.9601, <10> 35.2448, <11> 25.7249, <12> 45.924, <13> 30.2285, <14> 34.0424, <15> 21.5905, <16> 3.3426, <17> 13.3572, <18> 41.835, <19> 0.9173, <20> 38.5555;
param workload[JOB] := <1> 25.257, <2> 7.1841, <3> 6.9958, <4> 42.6911, <5> 4.677, <6> 27.9159, <7> 20.3048, <8> 31.7324, <9> 12.3717, <10> 3.6359, <11> 28.3915, <12> 4.0877, <13> 40.4737, <14> 5.7204, <15> 27.4187, <16> 7.4964, <17> 43.3412, <18> 13.3313, <19> 11.1998, <20> 2.8502;
param capacity[MACHINE] := <1> 367.0766, <2> 367.0766, <3> 367.0766, <4> 367.0766, <5> 367.0766, <6> 367.0766, <7> 367.0766;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
