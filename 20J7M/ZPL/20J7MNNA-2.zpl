set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.4568, <2> 18.9743, <3> 25.2391, <4> 16.1247, <5> 26.1393, <6> 20.0744, <7> 17.9549, <8> 23.3612, <9> 17.0749, <10> 24.699, <11> 19.4992, <12> 24.0291, <13> 22.6377, <14> 20.6643, <15> 21.7683, <16> 29.2509, <17> 25.1616, <18> 24.1022, <19> 25.2051, <20> 34.0889;
param workload[JOB] := <1> 598.1351, <2> 360.0241, <3> 637.0122, <4> 260.006, <5> 683.263, <6> 402.9815, <7> 322.3784, <8> 545.7457, <9> 291.5522, <10> 610.0406, <11> 380.2188, <12> 577.3976, <13> 512.4655, <14> 427.0133, <15> 473.8589, <16> 855.6152, <17> 633.1061, <18> 580.916, <19> 635.2971, <20> 1162.0531;
param capacity[MACHINE] := <1> 10949.0804, <2> 10949.0804, <3> 10949.0804, <4> 10949.0804, <5> 10949.0804, <6> 10949.0804, <7> 10949.0804;

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
