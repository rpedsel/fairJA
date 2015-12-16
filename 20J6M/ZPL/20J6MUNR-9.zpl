set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.0736, <2> 14.1633, <3> 13.1542, <4> 47.6905, <5> 44.355, <6> 18.7182, <7> 39.4269, <8> 49.841, <9> 16.691, <10> 10.3928, <11> 2.2425, <12> 37.0861, <13> 22.9213, <14> 18.8245, <15> 29.3045, <16> 26.4288, <17> 46.987, <18> 37.8802, <19> 21.3318, <20> 44.7294;
param workload[JOB] := <1> 14.5378, <2> 4.8763, <3> 2.1285, <4> 0.1862, <5> 30.9313, <6> 33.7566, <7> 21.491, <8> 35.3664, <9> 28.3456, <10> 3.6036, <11> 15.4348, <12> 41.8723, <13> 45.6131, <14> 19.9628, <15> 41.1254, <16> 44.8645, <17> 2.3615, <18> 31.9353, <19> 18.167, <20> 9.0208;
param capacity[MACHINE] := <1> 445.5808, <2> 445.5808, <3> 445.5808, <4> 445.5808, <5> 445.5808, <6> 445.5808;

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
