set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.5087, <2> 20.7178, <3> 35.8574, <4> 33.5261, <5> 48.186, <6> 18.6718, <7> 27.8413, <8> 27.9374, <9> 48.223, <10> 19.8557, <11> 14.0444, <12> 17.1553, <13> 12.6755, <14> 29.2491, <15> 42.7421, <16> 29.5729, <17> 28.8078, <18> 36.7643, <19> 0.8311, <20> 43.6379;
param workload[JOB] := <1> 1806.9896, <2> 429.2272, <3> 1285.7531, <4> 1123.9994, <5> 2321.8906, <6> 348.6361, <7> 775.138, <8> 780.4983, <9> 2325.4577, <10> 394.2488, <11> 197.2452, <12> 294.3043, <13> 160.6683, <14> 855.5099, <15> 1826.8871, <16> 874.5564, <17> 829.8893, <18> 1351.6138, <19> 0.6907, <20> 1904.2663;
param capacity[MACHINE] := <1> 2841.0672, <2> 2841.0672, <3> 2841.0672, <4> 2841.0672, <5> 2841.0672, <6> 2841.0672, <7> 2841.0672;

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