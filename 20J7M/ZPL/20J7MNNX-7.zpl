set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.3594, <2> 28.0908, <3> 27.3101, <4> 23.2436, <5> 28.4578, <6> 24.8466, <7> 28.7456, <8> 26.5019, <9> 27.3343, <10> 25.491, <11> 19.5784, <12> 30.5939, <13> 28.4602, <14> 17.1099, <15> 15.5011, <16> 28.0099, <17> 25.2339, <18> 16.2937, <19> 24.3378, <20> 23.3011;
param workload[JOB] := <1> 4.1665, <2> 5.3001, <3> 5.2259, <4> 4.8212, <5> 5.3346, <6> 4.9846, <7> 5.3615, <8> 5.148, <9> 5.2282, <10> 5.0489, <11> 4.4247, <12> 5.5312, <13> 5.3348, <14> 4.1364, <15> 3.9371, <16> 5.2924, <17> 5.0233, <18> 4.0365, <19> 4.9333, <20> 4.8271;
param capacity[MACHINE] := <1> 98.0963, <2> 98.0963, <3> 98.0963, <4> 98.0963, <5> 98.0963, <6> 98.0963, <7> 98.0963;

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
