set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.962, <2> 32.0927, <3> 8.2735, <4> 4.2387, <5> 16.988, <6> 29.1173, <7> 1.0226, <8> 20.2784, <9> 11.7928, <10> 28.07, <11> 36.8395, <12> 42.9257, <13> 3.1915, <14> 18.8534, <15> 8.1653, <16> 36.5736, <17> 17.436, <18> 27.812, <19> 42.675, <20> 49.4986;
param workload[JOB] := <1> 36.2065, <2> 20.4366, <3> 46.7125, <4> 10.8864, <5> 37.5952, <6> 27.6302, <7> 35.7041, <8> 20.6106, <9> 37.1136, <10> 34.3589, <11> 26.0694, <12> 49.1098, <13> 23.4211, <14> 10.1074, <15> 6.5794, <16> 42.8914, <17> 5.1975, <18> 13.0406, <19> 31.0744, <20> 32.0055;
param capacity[MACHINE] := <1> 546.7511, <2> 546.7511, <3> 546.7511, <4> 546.7511, <5> 546.7511, <6> 546.7511, <7> 546.7511;

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
