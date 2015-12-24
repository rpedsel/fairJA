set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.0764, <2> 11.1419, <3> 10.2344, <4> 23.04, <5> 11.45, <6> 3.9564, <7> 32.7361, <8> 21.0559, <9> 39.9266, <10> 19.5949, <11> 33.842, <12> 39.0382, <13> 0.6575, <14> 33.657, <15> 13.1742, <16> 27.244, <17> 1.9034, <18> 28.9996, <19> 16.4689, <20> 0.6006;
param workload[JOB] := <1> 26.0764, <2> 11.1419, <3> 10.2344, <4> 23.04, <5> 11.45, <6> 3.9564, <7> 32.7361, <8> 21.0559, <9> 39.9266, <10> 19.5949, <11> 33.842, <12> 39.0382, <13> 0.6575, <14> 33.657, <15> 13.1742, <16> 27.244, <17> 1.9034, <18> 28.9996, <19> 16.4689, <20> 0.6006;
param capacity[MACHINE] := <1> 42.2998, <2> 42.2998, <3> 42.2998, <4> 42.2998, <5> 42.2998, <6> 42.2998, <7> 42.2998;

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
