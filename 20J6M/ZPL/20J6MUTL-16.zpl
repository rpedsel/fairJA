set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 2.0968, <2> 38.0637, <3> 35.8829, <4> 47.9846, <5> 27.2272, <6> 2.7652, <7> 37.3275, <8> 17.3233, <9> 21.0726, <10> 6.7735, <11> 12.8338, <12> 21.7176, <13> 37.2494, <14> 19.9529, <15> 33.6751, <16> 25.2688, <17> 34.3881, <18> 19.1084, <19> 33.6428, <20> 14.7659;
param workload[JOB] := <1> 2.0968, <2> 38.0637, <3> 35.8829, <4> 47.9846, <5> 27.2272, <6> 2.7652, <7> 37.3275, <8> 17.3233, <9> 21.0726, <10> 6.7735, <11> 12.8338, <12> 21.7176, <13> 37.2494, <14> 19.9529, <15> 33.6751, <16> 25.2688, <17> 34.3881, <18> 19.1084, <19> 33.6428, <20> 14.7659;
param capacity[MACHINE] := <1> 61.14, <2> 61.14, <3> 61.14, <4> 61.14, <5> 61.14, <6> 61.14;

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
