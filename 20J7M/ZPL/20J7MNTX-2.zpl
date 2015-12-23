set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.1811, <2> 21.0764, <3> 18.0698, <4> 15.2007, <5> 20.2191, <6> 38.3515, <7> 23.8689, <8> 24.4822, <9> 25.8059, <10> 31.5212, <11> 24.6237, <12> 23.5658, <13> 27.1415, <14> 18.3979, <15> 25.1372, <16> 20.7894, <17> 27.6775, <18> 20.631, <19> 20.8694, <20> 27.8812;
param workload[JOB] := <1> 5.3086, <2> 4.5909, <3> 4.2509, <4> 3.8988, <5> 4.4966, <6> 6.1929, <7> 4.8856, <8> 4.9479, <9> 5.08, <10> 5.6144, <11> 4.9622, <12> 4.8545, <13> 5.2098, <14> 4.2893, <15> 5.0137, <16> 4.5595, <17> 5.2609, <18> 4.5421, <19> 4.5683, <20> 5.2803;
param capacity[MACHINE] := <1> 10.4794, <2> 10.4794, <3> 10.4794, <4> 10.4794, <5> 10.4794, <6> 10.4794, <7> 10.4794;

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
