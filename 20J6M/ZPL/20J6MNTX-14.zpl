set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.5957, <2> 24.0612, <3> 19.0622, <4> 23.704, <5> 29.2276, <6> 15.6251, <7> 23.3247, <8> 20.7602, <9> 28.6508, <10> 20.4843, <11> 32.9966, <12> 23.3843, <13> 24.5623, <14> 18.7092, <15> 19.841, <16> 23.9101, <17> 14.3486, <18> 25.5605, <19> 22.4409, <20> 18.1944;
param workload[JOB] := <1> 5.0592, <2> 4.9052, <3> 4.366, <4> 4.8687, <5> 5.4063, <6> 3.9529, <7> 4.8296, <8> 4.5563, <9> 5.3526, <10> 4.526, <11> 5.7443, <12> 4.8357, <13> 4.956, <14> 4.3254, <15> 4.4543, <16> 4.8898, <17> 3.788, <18> 5.0557, <19> 4.7372, <20> 4.2655;
param capacity[MACHINE] := <1> 11.8594, <2> 11.8594, <3> 11.8594, <4> 11.8594, <5> 11.8594, <6> 11.8594;

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
