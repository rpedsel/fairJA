set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.665, <2> 25.2208, <3> 30.7787, <4> 33.7692, <5> 24.3295, <6> 25.8332, <7> 23.6477, <8> 26.8034, <9> 27.3631, <10> 24.9343, <11> 29.6224, <12> 23.6625, <13> 21.7174, <14> 20.6205, <15> 28.4064, <16> 22.5499, <17> 18.6915, <18> 33.6055, <19> 32.9375, <20> 22.6862;
param workload[JOB] := <1> 4.6546, <2> 5.022, <3> 5.5479, <4> 5.8111, <5> 4.9325, <6> 5.0826, <7> 4.8629, <8> 5.1772, <9> 5.231, <10> 4.9934, <11> 5.4426, <12> 4.8644, <13> 4.6602, <14> 4.541, <15> 5.3298, <16> 4.7487, <17> 4.3234, <18> 5.797, <19> 5.7391, <20> 4.763;
param capacity[MACHINE] := <1> 101.5244, <2> 101.5244, <3> 101.5244, <4> 101.5244, <5> 101.5244, <6> 101.5244;

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
