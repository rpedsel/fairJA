set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.3862, <2> 34.6915, <3> 16.3432, <4> 22.4643, <5> 26.3346, <6> 22.6482, <7> 20.8466, <8> 27.6768, <9> 26.464, <10> 28.876, <11> 28.3314, <12> 21.661, <13> 23.3358, <14> 23.5295, <15> 23.7447, <16> 15.1952, <17> 21.2429, <18> 25.6548, <19> 24.0031, <20> 24.7907;
param workload[JOB] := <1> 32.6685, <2> 29.7524, <3> 2.9019, <4> 41.7511, <5> 6.9907, <6> 5.5623, <7> 0.5546, <8> 45.417, <9> 10.546, <10> 27.9224, <11> 32.8607, <12> 41.9326, <13> 48.1219, <14> 39.2902, <15> 26.7748, <16> 21.6697, <17> 40.7682, <18> 49.2747, <19> 18.8529, <20> 28.159;
param capacity[MACHINE] := <1> 68.9714, <2> 68.9714, <3> 68.9714, <4> 68.9714, <5> 68.9714, <6> 68.9714;

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
