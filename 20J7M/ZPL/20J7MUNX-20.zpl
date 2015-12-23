set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.7312, <2> 12.1904, <3> 34.5639, <4> 41.6974, <5> 30.4712, <6> 2.2152, <7> 27.8215, <8> 11.5202, <9> 29.3593, <10> 26.4438, <11> 20.3581, <12> 48.4659, <13> 39.2005, <14> 19.283, <15> 2.1556, <16> 5.196, <17> 11.8354, <18> 18.6168, <19> 34.2552, <20> 12.7851;
param workload[JOB] := <1> 3.2759, <2> 3.4915, <3> 5.8791, <4> 6.4574, <5> 5.5201, <6> 1.4884, <7> 5.2746, <8> 3.3941, <9> 5.4184, <10> 5.1424, <11> 4.512, <12> 6.9617, <13> 6.261, <14> 4.3912, <15> 1.4682, <16> 2.2795, <17> 3.4403, <18> 4.3147, <19> 5.8528, <20> 3.5756;
param capacity[MACHINE] := <1> 88.3989, <2> 88.3989, <3> 88.3989, <4> 88.3989, <5> 88.3989, <6> 88.3989, <7> 88.3989;

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
