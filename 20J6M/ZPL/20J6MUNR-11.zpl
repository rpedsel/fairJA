set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.7403, <2> 48.7126, <3> 40.0008, <4> 29.7072, <5> 23.7448, <6> 11.2353, <7> 43.6252, <8> 15.8519, <9> 4.0974, <10> 22.2974, <11> 22.8665, <12> 19.6123, <13> 49.2591, <14> 27.3358, <15> 18.0725, <16> 40.1722, <17> 4.7966, <18> 22.3451, <19> 35.2218, <20> 42.614;
param workload[JOB] := <1> 23.4667, <2> 13.3792, <3> 8.1169, <4> 30.4272, <5> 7.0185, <6> 26.4062, <7> 2.4142, <8> 15.2194, <9> 35.5451, <10> 41.2532, <11> 49.4553, <12> 27.2422, <13> 40.6251, <14> 39.3675, <15> 37.0753, <16> 9.7108, <17> 38.154, <18> 20.114, <19> 8.5889, <20> 22.934;
param capacity[MACHINE] := <1> 496.5137, <2> 496.5137, <3> 496.5137, <4> 496.5137, <5> 496.5137, <6> 496.5137;

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
