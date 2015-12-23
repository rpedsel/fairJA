set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.0149, <2> 25.1808, <3> 12.1856, <4> 24.6227, <5> 34.2802, <6> 25.2455, <7> 22.1117, <8> 22.9733, <9> 26.8984, <10> 20.0364, <11> 25.6313, <12> 23.307, <13> 26.6433, <14> 20.2832, <15> 27.3237, <16> 31.6667, <17> 25.6009, <18> 21.6535, <19> 16.787, <20> 29.3393;
param workload[JOB] := <1> 4.4738, <2> 5.018, <3> 3.4908, <4> 4.9621, <5> 5.8549, <6> 5.0245, <7> 4.7023, <8> 4.793, <9> 5.1864, <10> 4.4762, <11> 5.0627, <12> 4.8277, <13> 5.1617, <14> 4.5037, <15> 5.2272, <16> 5.6273, <17> 5.0597, <18> 4.6533, <19> 4.0972, <20> 5.4166;
param capacity[MACHINE] := <1> 97.6191, <2> 97.6191, <3> 97.6191, <4> 97.6191, <5> 97.6191, <6> 97.6191, <7> 97.6191;

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
