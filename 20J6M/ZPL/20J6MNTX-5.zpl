set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.9909, <2> 22.4812, <3> 26.5558, <4> 31.1799, <5> 22.9002, <6> 33.0274, <7> 16.9564, <8> 22.859, <9> 22.812, <10> 36.7764, <11> 25.8843, <12> 22.5624, <13> 29.3934, <14> 20.9195, <15> 20.1771, <16> 27.514, <17> 20.8134, <18> 25.5281, <19> 26.6944, <20> 18.0043;
param workload[JOB] := <1> 5.5669, <2> 4.7414, <3> 5.1532, <4> 5.5839, <5> 4.7854, <6> 5.7469, <7> 4.1178, <8> 4.7811, <9> 4.7762, <10> 6.0644, <11> 5.0877, <12> 4.75, <13> 5.4216, <14> 4.5738, <15> 4.4919, <16> 5.2454, <17> 4.5622, <18> 5.0525, <19> 5.1667, <20> 4.2431;
param capacity[MACHINE] := <1> 12.489, <2> 12.489, <3> 12.489, <4> 12.489, <5> 12.489, <6> 12.489;

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
