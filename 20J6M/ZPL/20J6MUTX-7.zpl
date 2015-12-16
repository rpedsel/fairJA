set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.9624, <2> 22.7804, <3> 12.4961, <4> 25.6113, <5> 37.0545, <6> 20.979, <7> 21.1779, <8> 15.491, <9> 43.7204, <10> 15.7395, <11> 24.4257, <12> 30.2239, <13> 25.3437, <14> 17.7484, <15> 21.8988, <16> 9.469, <17> 18.7094, <18> 43.6896, <19> 0.1389, <20> 40.3373;
param workload[JOB] := <1> 3.8681, <2> 4.7729, <3> 3.535, <4> 5.0608, <5> 6.0872, <6> 4.5803, <7> 4.6019, <8> 3.9359, <9> 6.6121, <10> 3.9673, <11> 4.9422, <12> 5.4976, <13> 5.0343, <14> 4.2129, <15> 4.6796, <16> 3.0772, <17> 4.3254, <18> 6.6098, <19> 0.3727, <20> 6.3512;
param capacity[MACHINE] := <1> 11.5156, <2> 11.5156, <3> 11.5156, <4> 11.5156, <5> 11.5156, <6> 11.5156;

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
