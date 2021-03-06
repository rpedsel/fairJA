set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.8236, <2> 19.604, <3> 21.1902, <4> 35.8275, <5> 25.6816, <6> 23.7686, <7> 27.122, <8> 24.8421, <9> 31.5055, <10> 23.966, <11> 21.8952, <12> 23.5051, <13> 29.1644, <14> 27.3088, <15> 22.7875, <16> 19.7961, <17> 26.9242, <18> 27.1786, <19> 22.1038, <20> 21.8695;
param workload[JOB] := <1> 22.8236, <2> 19.604, <3> 21.1902, <4> 35.8275, <5> 25.6816, <6> 23.7686, <7> 27.122, <8> 24.8421, <9> 31.5055, <10> 23.966, <11> 21.8952, <12> 23.5051, <13> 29.1644, <14> 27.3088, <15> 22.7875, <16> 19.7961, <17> 26.9242, <18> 27.1786, <19> 22.1038, <20> 21.8695;
param capacity[MACHINE] := <1> 71.2663, <2> 71.2663, <3> 71.2663, <4> 71.2663, <5> 71.2663, <6> 71.2663, <7> 71.2663;

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
