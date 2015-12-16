set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 13.832, <2> 30.6193, <3> 23.2075, <4> 27.7465, <5> 21.9052, <6> 20.7472, <7> 19.4962, <8> 21.8667, <9> 31.2247, <10> 21.2063, <11> 23.0748, <12> 20.0966, <13> 18.9391, <14> 20.4518, <15> 26.4107, <16> 27.153, <17> 21.9532, <18> 22.826, <19> 30.055, <20> 35.8965;
param workload[JOB] := <1> 13.832, <2> 30.6193, <3> 23.2075, <4> 27.7465, <5> 21.9052, <6> 20.7472, <7> 19.4962, <8> 21.8667, <9> 31.2247, <10> 21.2063, <11> 23.0748, <12> 20.0966, <13> 18.9391, <14> 20.4518, <15> 26.4107, <16> 27.153, <17> 21.9532, <18> 22.826, <19> 30.055, <20> 35.8965;
param capacity[MACHINE] := <1> 478.7083, <2> 478.7083, <3> 478.7083, <4> 478.7083, <5> 478.7083, <6> 478.7083;

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
