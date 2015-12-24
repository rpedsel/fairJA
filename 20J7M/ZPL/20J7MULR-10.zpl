set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.9194, <2> 44.9922, <3> 22.8465, <4> 32.8814, <5> 28.0046, <6> 27.7579, <7> 40.2916, <8> 28.328, <9> 35.7725, <10> 42.9543, <11> 39.7561, <12> 45.771, <13> 1.1788, <14> 15.3033, <15> 4.0189, <16> 47.4026, <17> 41.3579, <18> 39.6643, <19> 12.9937, <20> 8.5748;
param workload[JOB] := <1> 20.218, <2> 18.4077, <3> 31.7426, <4> 32.2183, <5> 47.7886, <6> 14.5782, <7> 12.992, <8> 36.0015, <9> 15.9469, <10> 5.5492, <11> 6.3616, <12> 41.1191, <13> 17.1153, <14> 48.5454, <15> 37.9823, <16> 23.5602, <17> 39.262, <18> 18.7117, <19> 43.6775, <20> 2.4944;
param capacity[MACHINE] := <1> 73.4675, <2> 73.4675, <3> 73.4675, <4> 73.4675, <5> 73.4675, <6> 73.4675, <7> 73.4675;

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
