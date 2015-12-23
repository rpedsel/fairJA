set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.315, <2> 31.6362, <3> 14.0579, <4> 10.2039, <5> 33.9127, <6> 13.401, <7> 28.5148, <8> 7.9314, <9> 18.7601, <10> 40.7092, <11> 4.7032, <12> 41.1267, <13> 14.9832, <14> 3.2777, <15> 28.9368, <16> 45.2549, <17> 27.4073, <18> 46.4581, <19> 18.6868, <20> 5.8013;
param workload[JOB] := <1> 6.505, <2> 5.6246, <3> 3.7494, <4> 3.1944, <5> 5.8235, <6> 3.6607, <7> 5.3399, <8> 2.8163, <9> 4.3313, <10> 6.3804, <11> 2.1687, <12> 6.413, <13> 3.8708, <14> 1.8104, <15> 5.3793, <16> 6.7272, <17> 5.2352, <18> 6.816, <19> 4.3228, <20> 2.4086;
param capacity[MACHINE] := <1> 13.2254, <2> 13.2254, <3> 13.2254, <4> 13.2254, <5> 13.2254, <6> 13.2254, <7> 13.2254;

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
