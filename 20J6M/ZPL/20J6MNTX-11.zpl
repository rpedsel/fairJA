set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.653, <2> 21.4664, <3> 25.8895, <4> 22.7143, <5> 27.0548, <6> 21.4761, <7> 24.992, <8> 18.3025, <9> 24.8568, <10> 30.8287, <11> 15.7988, <12> 23.6025, <13> 25.5043, <14> 29.6415, <15> 34.5691, <16> 18.0601, <17> 22.989, <18> 28.1162, <19> 22.8313, <20> 27.4527;
param workload[JOB] := <1> 4.8634, <2> 4.6332, <3> 5.0882, <4> 4.766, <5> 5.2014, <6> 4.6342, <7> 4.9992, <8> 4.2781, <9> 4.9857, <10> 5.5524, <11> 3.9748, <12> 4.8582, <13> 5.0502, <14> 5.4444, <15> 5.8795, <16> 4.2497, <17> 4.7947, <18> 5.3025, <19> 4.7782, <20> 5.2395;
param capacity[MACHINE] := <1> 12.3217, <2> 12.3217, <3> 12.3217, <4> 12.3217, <5> 12.3217, <6> 12.3217;

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
