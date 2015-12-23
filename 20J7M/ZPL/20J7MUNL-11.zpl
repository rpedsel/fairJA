set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.6215, <2> 23.1952, <3> 28.8344, <4> 16.9296, <5> 36.2319, <6> 33.4004, <7> 12.3198, <8> 27.5633, <9> 15.3928, <10> 46.0342, <11> 0.3209, <12> 13.0031, <13> 5.156, <14> 35.5882, <15> 28.0442, <16> 43.9594, <17> 26.7506, <18> 30.2058, <19> 40.56, <20> 16.4941;
param workload[JOB] := <1> 16.6215, <2> 23.1952, <3> 28.8344, <4> 16.9296, <5> 36.2319, <6> 33.4004, <7> 12.3198, <8> 27.5633, <9> 15.3928, <10> 46.0342, <11> 0.3209, <12> 13.0031, <13> 5.156, <14> 35.5882, <15> 28.0442, <16> 43.9594, <17> 26.7506, <18> 30.2058, <19> 40.56, <20> 16.4941;
param capacity[MACHINE] := <1> 496.6054, <2> 496.6054, <3> 496.6054, <4> 496.6054, <5> 496.6054, <6> 496.6054, <7> 496.6054;

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