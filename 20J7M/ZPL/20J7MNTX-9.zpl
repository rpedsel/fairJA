set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.1316, <2> 17.7022, <3> 27.6572, <4> 17.308, <5> 25.0456, <6> 30.6064, <7> 25.1299, <8> 24.4843, <9> 23.2321, <10> 24.3868, <11> 30.2665, <12> 17.9374, <13> 28.3517, <14> 38.0315, <15> 23.3641, <16> 25.9618, <17> 30.6653, <18> 29.3273, <19> 28.5141, <20> 32.1588;
param workload[JOB] := <1> 5.3974, <2> 4.2074, <3> 5.259, <4> 4.1603, <5> 5.0046, <6> 5.5323, <7> 5.013, <8> 4.9482, <9> 4.82, <10> 4.9383, <11> 5.5015, <12> 4.2353, <13> 5.3246, <14> 6.167, <15> 4.8336, <16> 5.0953, <17> 5.5376, <18> 5.4155, <19> 5.3399, <20> 5.6709;
param capacity[MACHINE] := <1> 10.9716, <2> 10.9716, <3> 10.9716, <4> 10.9716, <5> 10.9716, <6> 10.9716, <7> 10.9716;

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
