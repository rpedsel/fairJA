set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.6643, <2> 35.7986, <3> 21.2651, <4> 17.0799, <5> 25.1738, <6> 16.5347, <7> 24.0095, <8> 17.6839, <9> 24.6806, <10> 22.0755, <11> 29.061, <12> 26.3032, <13> 30.307, <14> 26.2793, <15> 25.7277, <16> 28.7821, <17> 22.6106, <18> 21.9056, <19> 26.3449, <20> 22.003;
param workload[JOB] := <1> 5.6271, <2> 5.9832, <3> 4.6114, <4> 4.1328, <5> 5.0173, <6> 4.0663, <7> 4.8999, <8> 4.2052, <9> 4.968, <10> 4.6985, <11> 5.3908, <12> 5.1287, <13> 5.5052, <14> 5.1263, <15> 5.0722, <16> 5.3649, <17> 4.7551, <18> 4.6803, <19> 5.1327, <20> 4.6907;
param capacity[MACHINE] := <1> 14.1509, <2> 14.1509, <3> 14.1509, <4> 14.1509, <5> 14.1509, <6> 14.1509, <7> 14.1509;

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
