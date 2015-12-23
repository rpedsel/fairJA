set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.878, <2> 20.2143, <3> 24.8004, <4> 21.8136, <5> 31.6403, <6> 23.8344, <7> 27.3511, <8> 22.846, <9> 19.2085, <10> 18.1525, <11> 20.8729, <12> 28.4864, <13> 18.6711, <14> 28.8583, <15> 19.3546, <16> 22.0474, <17> 22.5676, <18> 27.1584, <19> 17.9669, <20> 26.8785;
param workload[JOB] := <1> 4.7831, <2> 4.496, <3> 4.98, <4> 4.6705, <5> 5.625, <6> 4.882, <7> 5.2298, <8> 4.7797, <9> 4.3828, <10> 4.2606, <11> 4.5687, <12> 5.3373, <13> 4.321, <14> 5.372, <15> 4.3994, <16> 4.6955, <17> 4.7505, <18> 5.2114, <19> 4.2387, <20> 5.1844;
param capacity[MACHINE] := <1> 10.3037, <2> 10.3037, <3> 10.3037, <4> 10.3037, <5> 10.3037, <6> 10.3037, <7> 10.3037;

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
