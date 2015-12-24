set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.4236, <2> 7.0212, <3> 44.1542, <4> 30.6392, <5> 19.1965, <6> 17.6882, <7> 45.3096, <8> 46.9113, <9> 19.4717, <10> 13.5216, <11> 31.8498, <12> 35.8561, <13> 1.2852, <14> 0.7977, <15> 21.4005, <16> 12.5287, <17> 4.41, <18> 45.5852, <19> 16.3287, <20> 46.2689;
param workload[JOB] := <1> 21.4236, <2> 7.0212, <3> 44.1542, <4> 30.6392, <5> 19.1965, <6> 17.6882, <7> 45.3096, <8> 46.9113, <9> 19.4717, <10> 13.5216, <11> 31.8498, <12> 35.8561, <13> 1.2852, <14> 0.7977, <15> 21.4005, <16> 12.5287, <17> 4.41, <18> 45.5852, <19> 16.3287, <20> 46.2689;
param capacity[MACHINE] := <1> 51.6051, <2> 51.6051, <3> 51.6051, <4> 51.6051, <5> 51.6051, <6> 51.6051, <7> 51.6051;

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
