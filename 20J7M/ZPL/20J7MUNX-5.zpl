set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 13.0798, <2> 39.2702, <3> 42.7998, <4> 41.5333, <5> 2.7907, <6> 35.6355, <7> 38.893, <8> 27.2523, <9> 4.3372, <10> 48.2699, <11> 41.8798, <12> 10.648, <13> 0.5199, <14> 4.8012, <15> 9.9425, <16> 2.0546, <17> 18.592, <18> 27.4928, <19> 43.0704, <20> 7.0387;
param workload[JOB] := <1> 3.6166, <2> 6.2666, <3> 6.5422, <4> 6.4446, <5> 1.6705, <6> 5.9695, <7> 6.2364, <8> 5.2204, <9> 2.0826, <10> 6.9477, <11> 6.4715, <12> 3.2631, <13> 0.721, <14> 2.1912, <15> 3.1532, <16> 1.4334, <17> 4.3118, <18> 5.2434, <19> 6.5628, <20> 2.6531;
param capacity[MACHINE] := <1> 87.0016, <2> 87.0016, <3> 87.0016, <4> 87.0016, <5> 87.0016, <6> 87.0016, <7> 87.0016;

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
