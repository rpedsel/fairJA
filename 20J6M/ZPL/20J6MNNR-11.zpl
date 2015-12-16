set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.1963, <2> 23.1469, <3> 15.5824, <4> 23.4871, <5> 27.8294, <6> 24.3751, <7> 26.3024, <8> 19.9979, <9> 28.4366, <10> 17.9039, <11> 26.2275, <12> 27.9743, <13> 26.9308, <14> 31.9839, <15> 27.252, <16> 20.3955, <17> 16.0006, <18> 20.9791, <19> 23.1108, <20> 23.3724;
param workload[JOB] := <1> 24.898, <2> 36.8003, <3> 14.588, <4> 7.8409, <5> 21.6328, <6> 35.7509, <7> 30.0415, <8> 31.1746, <9> 23.0396, <10> 18.7027, <11> 17.2682, <12> 37.7078, <13> 1.9723, <14> 20.579, <15> 21.8817, <16> 31.393, <17> 23.7102, <18> 45.686, <19> 40.6019, <20> 13.7185;
param capacity[MACHINE] := <1> 498.9879, <2> 498.9879, <3> 498.9879, <4> 498.9879, <5> 498.9879, <6> 498.9879;

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
