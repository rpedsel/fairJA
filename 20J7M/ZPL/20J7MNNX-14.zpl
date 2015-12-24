set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.1054, <2> 20.2008, <3> 23.9826, <4> 31.0387, <5> 28.0008, <6> 24.6655, <7> 15.2688, <8> 26.7251, <9> 25.1225, <10> 25.0835, <11> 23.8994, <12> 23.2349, <13> 26.3802, <14> 16.4244, <15> 14.8435, <16> 24.2742, <17> 21.3786, <18> 24.8706, <19> 25.9819, <20> 21.5415;
param workload[JOB] := <1> 4.371, <2> 4.4945, <3> 4.8972, <4> 5.5712, <5> 5.2916, <6> 4.9664, <7> 3.9075, <8> 5.1696, <9> 5.0122, <10> 5.0083, <11> 4.8887, <12> 4.8203, <13> 5.1362, <14> 4.0527, <15> 3.8527, <16> 4.9269, <17> 4.6237, <18> 4.987, <19> 5.0972, <20> 4.6413;
param capacity[MACHINE] := <1> 95.7162, <2> 95.7162, <3> 95.7162, <4> 95.7162, <5> 95.7162, <6> 95.7162, <7> 95.7162;

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
