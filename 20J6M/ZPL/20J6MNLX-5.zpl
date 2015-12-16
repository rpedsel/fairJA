set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.0011, <2> 32.7164, <3> 27.0131, <4> 17.1165, <5> 19.2153, <6> 21.7535, <7> 20.7183, <8> 25.8529, <9> 20.1473, <10> 28.0898, <11> 13.1889, <12> 16.7168, <13> 28.3071, <14> 20.0554, <15> 32.4227, <16> 14.0017, <17> 24.0602, <18> 23.8935, <19> 24.5404, <20> 20.6413;
param workload[JOB] := <1> 4.6905, <2> 5.7198, <3> 5.1974, <4> 4.1372, <5> 4.3835, <6> 4.6641, <7> 4.5517, <8> 5.0846, <9> 4.4886, <10> 5.3, <11> 3.6317, <12> 4.0886, <13> 5.3204, <14> 4.4783, <15> 5.6941, <16> 3.7419, <17> 4.9051, <18> 4.8881, <19> 4.9538, <20> 4.5433;
param capacity[MACHINE] := <1> 15.7438, <2> 15.7438, <3> 15.7438, <4> 15.7438, <5> 15.7438, <6> 15.7438;

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
