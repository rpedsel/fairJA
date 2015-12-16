set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.0221, <2> 19.3793, <3> 19.0929, <4> 16.525, <5> 24.4704, <6> 10.7993, <7> 17.3201, <8> 16.0835, <9> 33.6044, <10> 8.8834, <11> 34.2158, <12> 46.9393, <13> 14.5626, <14> 31.8486, <15> 15.8397, <16> 21.8824, <17> 30.9759, <18> 17.12, <19> 34.0346, <20> 2.9824;
param workload[JOB] := <1> 15.6667, <2> 0.1372, <3> 14.2677, <4> 32.6824, <5> 16.9057, <6> 2.1294, <7> 13.1601, <8> 11.2061, <9> 38.6361, <10> 31.3931, <11> 4.0961, <12> 49.7066, <13> 4.1063, <14> 29.4172, <15> 1.8371, <16> 39.4831, <17> 23.5937, <18> 34.4664, <19> 38.7314, <20> 19.1421;
param capacity[MACHINE] := <1> 52.5955, <2> 52.5955, <3> 52.5955, <4> 52.5955, <5> 52.5955, <6> 52.5955;

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
