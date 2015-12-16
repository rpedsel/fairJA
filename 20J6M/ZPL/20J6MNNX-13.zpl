set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.7736, <2> 22.8478, <3> 18.8427, <4> 27.034, <5> 24.5653, <6> 21.6781, <7> 32.3487, <8> 21.2968, <9> 27.3866, <10> 22.053, <11> 26.4925, <12> 29.1574, <13> 30.247, <14> 29.8743, <15> 16.4309, <16> 23.6798, <17> 35.9432, <18> 28.4509, <19> 28.2772, <20> 36.1314;
param workload[JOB] := <1> 4.9773, <2> 4.7799, <3> 4.3408, <4> 5.1994, <5> 4.9563, <6> 4.656, <7> 5.6876, <8> 4.6148, <9> 5.2332, <10> 4.6961, <11> 5.1471, <12> 5.3998, <13> 5.4997, <14> 5.4657, <15> 4.0535, <16> 4.8662, <17> 5.9953, <18> 5.3339, <19> 5.3176, <20> 6.0109;
param capacity[MACHINE] := <1> 102.2311, <2> 102.2311, <3> 102.2311, <4> 102.2311, <5> 102.2311, <6> 102.2311;

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
