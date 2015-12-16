set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.2625, <2> 35.1465, <3> 31.2951, <4> 1.9723, <5> 15.243, <6> 47.5457, <7> 21.6216, <8> 33.745, <9> 20.4484, <10> 10.9516, <11> 15.2672, <12> 1.9092, <13> 48.1074, <14> 40.3779, <15> 22.4448, <16> 40.4253, <17> 9.7062, <18> 8.7072, <19> 12.2039, <20> 0.2353;
param workload[JOB] := <1> 5.2214, <2> 5.9284, <3> 5.5942, <4> 1.4044, <5> 3.9042, <6> 6.8953, <7> 4.6499, <8> 5.809, <9> 4.522, <10> 3.3093, <11> 3.9073, <12> 1.3817, <13> 6.9359, <14> 6.3544, <15> 4.7376, <16> 6.3581, <17> 3.1155, <18> 2.9508, <19> 3.4934, <20> 0.4851;
param capacity[MACHINE] := <1> 10.8697, <2> 10.8697, <3> 10.8697, <4> 10.8697, <5> 10.8697, <6> 10.8697;

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
