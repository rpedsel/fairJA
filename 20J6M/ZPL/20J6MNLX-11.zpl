set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.6361, <2> 27.0926, <3> 27.7249, <4> 25.9957, <5> 26.449, <6> 29.9035, <7> 32.6427, <8> 31.3956, <9> 22.4158, <10> 26.3459, <11> 17.4599, <12> 17.5444, <13> 29.071, <14> 16.5993, <15> 17.9151, <16> 30.5915, <17> 23.5923, <18> 29.332, <19> 19.4287, <20> 29.0761;
param workload[JOB] := <1> 5.3513, <2> 5.2051, <3> 5.2654, <4> 5.0986, <5> 5.1429, <6> 5.4684, <7> 5.7134, <8> 5.6032, <9> 4.7345, <10> 5.1328, <11> 4.1785, <12> 4.1886, <13> 5.3918, <14> 4.0742, <15> 4.2326, <16> 5.531, <17> 4.8572, <18> 5.4159, <19> 4.4078, <20> 5.3922;
param capacity[MACHINE] := <1> 16.7309, <2> 16.7309, <3> 16.7309, <4> 16.7309, <5> 16.7309, <6> 16.7309;

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
